% Create database and add sample students
db = StudentDatabase();
db = db.addStudent(Student(1, 'Alice', 20, 3.8, 'Computer Science'));
db = db.addStudent(Student(2, 'Bob', 21, 3.5, 'Mathematics'));
db = db.addStudent(Student(3, 'Charlie', 22, 3.9, 'Physics'));
db = db.addStudent(Student(4, 'David', 23, 3.2, 'Engineering'));

% Save database to file
db.saveToFile('studentDatabase.mat');

% Load database from file
db = db.loadFromFile('studentDatabase.mat');

% Find student by ID
student = db.findStudentByID(2);
if ~isempty(student)
    student.displayInfo();
else
    disp('Student not found.');
end

% Get list of students by major
csStudents = db.getStudentsByMajor('Computer Science');
for i = 1:length(csStudents)
    csStudents(i).displayInfo();
end

% Visualizations
% GPA distribution histogram
gpas = arrayfun(@(s) s.GPA, db.Students);
figure;
histogram(gpas);
title('GPA Distribution');
xlabel('GPA');
ylabel('Frequency');

% Average GPA by major
majors = unique(arrayfun(@(s) s.Major, db.Students, 'UniformOutput', false));
avgGPA = zeros(length(majors), 1);
for i = 1:length(majors)
    majorStudents = db.getStudentsByMajor(majors{i});
    avgGPA(i) = mean(arrayfun(@(s) s.GPA, majorStudents));
end
figure;
bar(categorical(majors), avgGPA);
title('Average GPA by Major');
xlabel('Major');
ylabel('Average GPA');

% Age distribution
ages = arrayfun(@(s) s.Age, db.Students);
figure;
histogram(ages);
title('Age Distribution');
xlabel('Age');
ylabel('Frequency');
