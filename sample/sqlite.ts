import { Database } from "bun:sqlite";

type User = {
	id?: number,
	name: string;
	age: number;
};

const db = new Database("db.sqlite");
db.exec("PRAGMA journal_mode = WAL;");

console.log(db.exec(`CREATE TABLE IF NOT EXISTS person (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER);`));

const newUsers: User[] = [
	{ name: 'test1', age: 1 },
	{ name: 'test2', age: 2 },
	{ name: 'test3', age: 3 }
]

const insertUser = db.prepare(`INSERT INTO person (name, age) VALUES (?, ?);`);

const insertMany = db.transaction((users: User[]) => {
	for (const user of users) {
		insertUser.run(user.name, user.age);
	}
});

//console.log(db.exec(`DELETE FROM person;`));
insertMany(newUsers);
console.log(db.query(`SELECT * FROM person;`).all());
