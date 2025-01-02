#include <iostream>
#include <unordered_map>
#include <string>
#include <vector>

template <typename KeyType, typename ValueType>
class Dictionary
{
private:
    std::unordered_map<KeyType, ValueType> hashTable;

public:
    // Function to add a key-value pair to the dictionary
    void insert(const KeyType &key, const ValueType &value)
    {
        hashTable[key] = value; // Insert or update the key-value pair
    }

    // Function to remove a key-value pair from the dictionary
    void remove(const KeyType &key)
    {
        auto it = hashTable.find(key);
        if (it != hashTable.end())
        {
            hashTable.erase(it); // Remove the key-value pair if found
        }
        else
        {
            std::cout << "Key not found!\n";
        }
    }

    // Function to check if a key exists in the dictionary
    bool contains(const KeyType &key) const
    {
        return hashTable.find(key) != hashTable.end();
    }

    // Function to get the value associated with a key
    ValueType get(const KeyType &key) const
    {
        auto it = hashTable.find(key);
        if (it != hashTable.end())
        {
            return it->second; // Return the value if key is found
        }
        else
        {
            throw std::runtime_error("Key not found!"); // Throw an exception if key is not found
        }
    }

    // Function to get the size of the dictionary
    size_t size() const
    {
        return hashTable.size();
    }

    // Function to check if the dictionary is empty
    bool isEmpty() const
    {
        return hashTable.empty();
    }

    // Function to display all key-value pairs in the dictionary
    void display() const
    {
        if (hashTable.empty())
        {
            std::cout << "Dictionary is empty!\n";
            return;
        }
        for (const auto &pair : hashTable)
        {
            std::cout << "Key: " << pair.first << ", Value: " << pair.second << std::endl;
        }
    }
};

std::string mostUsedWord(std::string sentence)
{
    Dictionary<std::string, int> tracker;
    std::vector<char> word;
    std::pair<std::string, int> mostUsed = {"empty", 0};

    for (auto c : sentence)
    {
        if (!word.empty() && (c == '.' || c == ',' || c == ' '))
        {
            int count = 0;
            std::string newWord(word.begin(), word.end());
            if (tracker.contains(newWord))
            {
                count = tracker.get(newWord);
                tracker.remove(newWord);
            }
            count++;
            tracker.insert(newWord, count);

            if (count > mostUsed.second)
            {
                mostUsed.first = newWord;
                mostUsed.second = count;
            }
            word.clear();
        }
        else
        {
            word.push_back(c);
        }
    }

    return mostUsed.first;
}

int main()
{
    std::cout << mostUsedWord("The cattle were running back and forth, but there was no wolf to be seen, heard or smelled, so the shepherd decided to take a little nap in a bed of grass and early summer flowers. Soon he was awakened by a sound he had never heard before.") << std::endl;
    return 0;
}