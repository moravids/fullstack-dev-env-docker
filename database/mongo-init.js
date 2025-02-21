// Get credentials from environment variables
const MONGO_USER = _getEnv('MONGO_USER')
const MONGO_PASSWORD = _getEnv('MONGO_PASSWORD')
const MONGO_DB = _getEnv('MONGO_DB')

// Authenticate with root credentials
db.auth(MONGO_USER, MONGO_PASSWORD)

// Switch to the specified database
db = db.getSiblingDB(MONGO_DB)

// Create a test collection
db.createCollection('test')

// Insert a test document
db.test.insert({
    name: "Test Document",
    createdAt: new Date()
})

// Create a user for the database with same credentials
db.createUser({
    user: MONGO_USER,
    pwd: MONGO_PASSWORD,
    roles: [
        {
            role: 'readWrite',
            db: MONGO_DB
        }
    ]
})