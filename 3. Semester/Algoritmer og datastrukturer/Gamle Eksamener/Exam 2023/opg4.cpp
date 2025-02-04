#include <vector>
#include <iostream>
#include <unordered_map>
#include <array>
using namespace std;

struct flight_location
{
    int price;
    int airport;

    bool operator==(const flight_location &other) const
    {
        return (price == other.price && airport == other.airport);
    }
};

struct flight_location_hash
{
    std::size_t operator()(const flight_location &location) const
    {
        std::hash<int> hf;
        return hf(location.price ^ (location.airport << 1));
    }
};

flight_location pick_flight(int n, array<int, 5> currFlight, vector<array<int, 5>> &flights, int src, int dst, int stops, unordered_map<flight_location, flight_location, flight_location_hash> &path)
{
    flight_location empty_location = {0, 0};
    if (currFlight[1] == dst) {
        return
    }
    return empty_location;
}

flight_location flight_find_cheapest(int n, vector<array<int, 5>> &flights, int src, int dst, int stops, unordered_map<flight_location, flight_location, flight_location_hash> &path)
{
    // unordered_map<array<int, 5>, bool> used;
    flight_location empty_location = {0, 0};

    for (auto flight : flights)
    {
        cout << "yup" << endl;
        pick_flight(n, flight, flights, src, dst, stops, path);
    }

    return empty_location;
}

int main()
{
    vector<array<int, 5>> flights = {
        {0, 1, 500, 0, 1},
        {0, 3, 200, 0, 1},
        {3, 1, 200, 2, 3},
        {1, 4, 100, 4, 5},
        {1, 2, 500, 4, 5},
        {4, 2, 100, 6, 7}};

    unordered_map<flight_location, flight_location, flight_location_hash> path;
    flight_find_cheapest(6, flights, 0, 2, 3, path);

    return 0;
}