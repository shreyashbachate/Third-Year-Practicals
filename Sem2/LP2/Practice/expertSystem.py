# Performance Evaluation Expert System with AI

from sklearn import tree

# Define the training dataset
# Each entry contains features and corresponding performance label
training_data = [
    [[90, 70, 85, 80, 75, 70], 'Good performance'],
    [[85, 75, 90, 95, 80, 85], 'Outstanding performance'],
    [[75, 80, 80, 70, 75, 85], 'Satisfactory performance'],
    [[70, 65, 70, 60, 70, 60], 'Poor performance'],
    # Add more entries with features and labels
]

# Define the feature names for better feedback
feature_names = [
    'Attendance Percentage',
    'Teamwork Rating',
    'Communication Rating',
    'Productivity Rating',
    'Attitude Rating',
    'Punctuality Rating'
]

# Extract features and labels from the training dataset
X_train = [entry[0] for entry in training_data]
y_train = [entry[1] for entry in training_data]

# Train the AI model (decision tree classifier)
model = tree.DecisionTreeClassifier()
model.fit(X_train, y_train)

# Gather inputs from the user
employee_name = input("Enter the employee's name: ")

# Initialize the total score
total_score = 0

# Ask questions to collect features
features = []
for feature_name in feature_names:
    feature = float(input(f"Enter the employee's {feature_name} (out of 100): "))
    features.append(feature)

# Make a prediction using the trained AI model
prediction = model.predict([features])[0]

# Print the evaluation result
print(f"{employee_name} has {prediction}.")

# Provide feedback on areas for improvement
if prediction != 'Outstanding performance':
    print("\nAreas for improvement:")
    for i, feature_name in enumerate(feature_names):
        if features[i] < 70:
            print(f"- {feature_name} needs improvement")