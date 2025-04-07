package com.example

class TeamController {

    def show(String id) {
        def teams = [
                'redbull': [
                        name: 'Oracle Red Bull Racing',
                        base: 'Milton Keynes, UK',
                        principal: 'Christian Horner',
                        drivers: ['Max Verstappen', 'Yuki Tsunoda'], // Cambio: Tsunoda reemplazó a Lawson:cite[3]:cite[7]
                        chassis: 'RB21',
                        engine: 'Honda RBPT',
                        founded: 2005,
                        championships: 6,

                ],
                'ferrari': [
                        name: 'Scuderia Ferrari HP',
                        base: 'Maranello, Italy',
                        principal: 'Frédéric Vasseur',
                        drivers: ['Charles Leclerc', 'Lewis Hamilton'], // Hamilton reemplazó a Sainz:cite[4]:cite[8]
                        chassis: 'SF-25',
                        engine: 'Ferrari 066/12',
                        founded: 1929,
                        championships: 16,

                ],
                'mercedes': [
                        name: 'Mercedes-AMG Petronas F1 Team',
                        base: 'Brackley, UK',
                        principal: 'Toto Wolff',
                        drivers: ['George Russell', 'Andrea Kimi Antonelli'], // Antonelli reemplazó a Hamilton:cite[4]:cite[7]
                        chassis: 'F1 W16',
                        engine: 'Mercedes-AMG F1 M16',
                        founded: 2010,
                        championships: 8,

                ],
                'mclaren': [
                        name: 'McLaren Formula 1 Team',
                        base: 'Woking, UK',
                        principal: 'Andrea Stella',
                        drivers: ['Lando Norris', 'Oscar Piastri'], // Único equipo sin cambios en la alineación:cite[8]
                        chassis: 'MCL39',
                        engine: 'Mercedes-AMG F1 M16',
                        founded: 1963,
                        championships: 8,

                ],
                'astonmartin': [
                        name: 'Aston Martin Aramco Cognizant F1 Team',
                        base: 'Silverstone, UK',
                        principal: 'Andy Cowell', // Nuevo director:cite[8]
                        drivers: ['Fernando Alonso', 'Lance Stroll'], // Sin cambios:cite[6]
                        chassis: 'AMR25',
                        engine: 'Mercedes-AMG F1 M16',
                        founded: 2018,
                        championships: 0,

                ],
                'alpine': [
                        name: 'BWT Alpine F1 Team',
                        base: 'Enstone, UK',
                        principal: 'Bruno Famin',
                        drivers: ['Pierre Gasly', 'Jack Doohan'], // Doohan reemplazó a Ocon:cite[4]:cite[6]
                        chassis: 'A525',
                        engine: 'Renault E-Tech RE25',
                        founded: 1986,
                        championships: 0,

                ],
                'williams': [
                        name: 'Atlassian Williams Racing',
                        base: 'Grove, UK',
                        principal: 'James Vowles',
                        drivers: ['Alex Albon', 'Carlos Sainz'], // Sainz reemplazó a Sargeant:cite[5]:cite[7]
                        chassis: 'FW47',
                        engine: 'Mercedes-AMG F1 M16',
                        founded: 1977,
                        championships: 9,

                ],
                'haas': [
                        name: 'MoneyGram Haas F1 Team',
                        base: 'Kannapolis, USA',
                        principal: 'Guenther Steiner',
                        drivers: ['Esteban Ocon', 'Oliver Bearman'], // Nueva alineación completa:cite[4]:cite[6]
                        chassis: 'VF-25',
                        engine: 'Ferrari 066/12',
                        founded: 2016,
                        championships: 0,

                ],
                'rb': [
                        name: 'Visa Cash App Racing Bulls F1 Team', // Nuevo nombre:cite[5]
                        base: 'Faenza, Italy',
                        principal: 'Laurent Mekies',
                        drivers: ['Liam Lawson', 'Isack Hadjar'], // Hadjar es novato:cite[3]:cite[7]
                        chassis: 'VCARB 02',
                        engine: 'Honda RBPT',
                        founded: 2006,
                        championships: 0,

                ],
                'sauber': [
                        name: 'Stake F1 Team Kick Sauber',
                        base: 'Hinwil, Switzerland',
                        principal: 'Jonathan Wheatley', // Nuevo desde abril:cite[8]
                        drivers: ['Nico Hülkenberg', 'Gabriel Bortoleto'], // Nueva alineación:cite[4]:cite[6]
                        chassis: 'C45',
                        engine: 'Ferrari 066/12',
                        founded: 1993,
                        championships: 0,

                ]
        ]

        def team = teams[id]

        if (!team) {
            response.sendError(404)
            return
        }

        [team: team, teamId: id]
    }
}