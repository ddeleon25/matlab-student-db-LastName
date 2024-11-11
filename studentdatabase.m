classdef StudentDatabase
    properties
        Students
    end
    
    methods
        function obj = StudentDatabase()
            obj.Students = [];
        end
        
        function obj = addStudent(obj, student)
            obj.Students = [obj.Students; student];
        end
        
        function student = findStudentByID(obj, ID)
            student = [];
            for i = 1:length(obj.Students)
                if obj.Students(i).ID == ID
                    student = obj.Students(i);
                    return;
                end
            end
        end
        
        function students = getStudentsByMajor(obj, major)
            students = [];
            for i = 1:length(obj.Students)
                if strcmp(obj.Students(i).Major, major)
                    students = [students; obj.Students(i)];
                end
            end
        end
        
        function saveToFile(obj, filename)
            students = obj.Students;
            save(filename, 'students');
        end
        
        function obj = loadFromFile(obj, filename)
            loadedData = load(filename);
            obj.Students = loadedData.students;
        end
    end
end
