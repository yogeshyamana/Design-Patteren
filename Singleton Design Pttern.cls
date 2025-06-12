/**
 * @description
 * This class demonstrates the Singleton Design Pattern in Apex.
 * The Singleton pattern ensures that a class has only one instance and provides a global point of access to it.
 * 
 * ⚙️ Use Case:
 * - When you need to share a single instance of a class (e.g., configuration manager, caching logic, utility service).
 * - Helps in scenarios where creating multiple instances would be expensive or unnecessary.
 * - Especially useful in stateless Apex contexts where a single reference point is needed.
 *
 * 💡 Example Use Cases in Salesforce:
 * - Accessing application-level settings stored in Custom Metadata or Custom Settings.
 * - Reusing complex calculations or configuration logic without repeated instantiations.
 * - Managing transaction-scoped state (e.g., logging).
 *
 * ❗ Important:
 * - Singleton is scoped to a single transaction context in Apex.
 * - Not truly global across requests (like static in Java or .NET), but useful within the current transaction.
 *
 * 🔒 Thread Safety:
 * - Apex executes in a single-threaded environment (per request), so thread safety is not an issue.
 */
public class SingletonExample {

    // Private static variable that holds the single instance
    private static SingletonExample instance;

    // Example data member for demonstration purposes
    public String configurationValue { get; private set; }

    // Private constructor to prevent external instantiation
    private SingletonExample() {
        // Initialization logic here
        configurationValue = 'App-wide configuration loaded';
    }

    /**
     * @description
     * Public method to get the singleton instance of the class.
     * Creates the instance if it does not exist.
     *
     * @return SingletonExample - the single instance of this class
     */
    public static SingletonExample getInstance() {
        if (instance == null) {
            instance = new SingletonExample();
        }
        return instance;
    }

    /**
     * Example method to show business logic that can be reused.
     * @return String
     */
    public String getConfig() {
        return configurationValue;
    }
}
