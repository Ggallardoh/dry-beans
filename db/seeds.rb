route1 = Route.create(name: "Ruta 1")
route2 = Route.create(name: "Ruta 2")

trip1 = Trip.create(order: 1, route: route1)
trip2 = Trip.create(order: 2, route: route1)
trip3 = Trip.create(order: 3, route: route2)
trip4 = Trip.create(order: 4, route: route2)

Delivery.create(recipient: "German Gallardo",
                address: "Las direcciones 123",
                trip: trip1)
Delivery.create(recipient: "German Gallarda",
                address: "Las direcciones 1234",
                trip: trip1)
Delivery.create(recipient: "German Gallarde",
                address: "Las direcciones 12345",
                trip: trip1)
Delivery.create(recipient: "German Gallardi",
                address: "Las direcciones 123456",
                trip: trip2)

Pickup.create(sender: "German Gallardos",
              address: "Las direcciones 123",
              trip: trip1)
Pickup.create(sender: "German Gallardas",
              address: "Las direcciones 1234",
              trip: trip1)
Pickup.create(sender: "German Gallardes",
              address: "Las direcciones 12345",
              trip: trip2)