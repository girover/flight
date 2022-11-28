-- get all flights

SELECT flight.FlightID, DepartureTime, ArrivalTime, TicketPrice, a1.Name AS 'From_Airport', a2.Name AS 'To_Airport', Distance, 
CONCAT(Duration DIV 60, 'h ', MOD(Duration, 60), 'm') AS Duaration
FROM flight, airport a1, airport a2, route
WHERE route.FromAirportCode = a1.AirportCode 
AND route.ToAirportCode = a2.AirportCode
AND route.RouteID = flight.RouteID;

-- get all flights from københavn

SELECT flight.FlightID, DepartureTime, ArrivalTime, TicketPrice, a1.Name AS 'From_Airport', a2.Name AS 'To_Airport', Distance, 
CONCAT(Duration DIV 60, 'h ', MOD(Duration, 60), 'm') AS Duaration
FROM flight, airport a1, airport a2, route
WHERE route.FromAirportCode = a1.AirportCode 
AND route.ToAirportCode = a2.AirportCode
AND route.RouteID = flight.RouteID
AND a1.CityId = (
    SELECT ID FROM city where Name = 'København'
);

-- get all flights from Bilund

SELECT flight.FlightID, DepartureTime, ArrivalTime, TicketPrice, a1.Name AS 'From_Airport', a2.Name AS 'To_Airport', Distance, 
CONCAT(Duration DIV 60, 'h ', MOD(Duration, 60), 'm') AS Duaration
FROM flight, airport a1, airport a2, route
WHERE route.FromAirportCode = a1.AirportCode 
AND route.ToAirportCode = a2.AirportCode
AND route.RouteID = flight.RouteID
AND a1.CityId = (
    SELECT ID FROM city where Name = 'Billund'
);

-- get all flights To Bilund

SELECT flight.FlightID, DepartureTime, ArrivalTime, TicketPrice, a1.Name AS 'From_Airport', a2.Name AS 'To_Airport', Distance, 
CONCAT(Duration DIV 60, 'h ', MOD(Duration, 60), 'm') AS Duaration
FROM flight, airport a1, airport a2, route
WHERE route.FromAirportCode = a1.AirportCode 
AND route.ToAirportCode = a2.AirportCode
AND route.RouteID = flight.RouteID
AND a2.CityId = (
    SELECT ID FROM city where Name = 'Billund'
);

-- Get all passengers on Flight number <flight number>

SELECT passenger.*, flight.FlightID
FROM flight, passenger, ticket
WHERE ticket.PassengerID = passenger.PassengerID 
AND ticket.FlightID = flight.FlightID 
AND flight.FlightID = 1;

-- Get all tickets of client <clientId>

SELECT ticket.TicketID, passenger.FirstName, passenger.LastName, 
a1.Name as From_airport, a2.Name as To_Airport, plane.Class, flight.ticketPrice as Ticker_price
FROM ticket, client, `order`, passenger, airport a1, airport a2, flight, route, plane
WHERE passenger.PassengerID = ticket.PassengerID
AND ticket.OrderId = `order`.OrderID
AND ticket.FlightId = flight.FlightID
AND client.ClientID = `order`.ClientID
AND flight.RouteID = route.RouteID 
AND route.FromAirportCode = a1.AirportCode  
AND route.ToAirportCode = a2.AirportCode  
AND route.PlaneID = plane.PlaneID  
AND client.ClientID = 1;

-- Get total price of tickets for client <clientId>

SELECT SUM(flight.ticketPrice) as Total_price
FROM ticket, client, `order`, passenger, airport a1, airport a2, flight, route
WHERE passenger.PassengerID = ticket.PassengerID
AND ticket.OrderId = `order`.OrderID
AND ticket.FlightId = flight.FlightID
AND client.ClientID = `order`.ClientID
AND flight.RouteID = route.RouteID 
AND route.FromAirportCode = a1.AirportCode  
AND route.ToAirportCode = a2.AirportCode  
AND client.ClientID = 1;