classdef Student
    properties
        ID
        Name
        Age
        GPA
        Major
    end
    
    methods
        function obj = Student(ID, Name, Age, GPA, Major)
            obj.ID = ID;
            obj.Name = Name;
            obj.Age = Age;
            obj.GPA = GPA;
            obj.Major = Major;
        end
        
        function displayInfo(obj)
            fprintf('ID: %d\nName: %s\nAge: %d\nGPA: %.2f\nMajor: %s\n', ...
                obj.ID, obj.Name, obj.Age, obj.GPA, obj.Major);
        end
        
        function obj = updateGPA(obj, newGPA)
            obj.GPA = newGPA;
        end
    end
end
