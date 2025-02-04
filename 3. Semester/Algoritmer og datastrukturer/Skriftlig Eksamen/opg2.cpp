#include <iostream>

struct Node
{
    int value;
    Node *left;
    Node *right;
};

int countLonelyChildren(Node *root)
{
    int count = 0;
    if (root->left != nullptr)
    {
        if (root->right == nullptr)
        {
            count++;
        }
        count += countLonelyChildren(root->left);
    }
    if (root->right != nullptr)
    {
        if (root->left == nullptr)
        {
            count++;
        }
        count += countLonelyChildren(root->right);
    }
    return count;
}

int main()
{
    Node right = {1, nullptr, nullptr};
    Node leftleft = {1, nullptr, nullptr};
    Node left = {1, &leftleft, nullptr};
    Node tree = {1, &left, &right};
    std::cout << countLonelyChildren(&tree) << std::endl;
    return 0;
}