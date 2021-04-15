const words = [
    {
        "id": 1,
        "souscat": {
            "nom": "ok"
        }
    },
    {
        "id": 2,
        "souscat": {
            "nom": "nope"
        }
    },
];

const result = words.filter(word => word.id === 1);
const sousCat = result.filter(result => result.souscat)
console.log(result[0].souscat)