CREATE TABLE pandemic.entities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Entity VARCHAR(255) NOT NULL,
    Code VARCHAR(50)
);

INSERT INTO pandemic.entities (Entity, Code)
SELECT DISTINCT Entity, Code
FROM pandemic.infectious_cases;

CREATE TABLE pandemic.infectious_cases_normalized (
    id INT AUTO_INCREMENT PRIMARY KEY,
    entity_id INT NOT NULL,
    Year YEAR,
    Number_yaws DOUBLE,
    polio_cases DOUBLE,
    cases_guinea_worm DOUBLE,
    Number_rabies DOUBLE,
    Number_malaria DOUBLE,
    Number_hiv DOUBLE,
    Number_tuberculosis DOUBLE,
    Number_smallpox DOUBLE,
    Number_cholera_cases DOUBLE,
    FOREIGN KEY (entity_id) REFERENCES pandemic.entities(id) ON DELETE CASCADE
);

INSERT INTO pandemic.infectious_cases_normalized (
    entity_id, 
    Year, 
    Number_yaws, 
    polio_cases, 
    cases_guinea_worm, 
    Number_rabies, 
    Number_malaria, 
    Number_hiv, 
    Number_tuberculosis, 
    Number_smallpox, 
    Number_cholera_cases
)
SELECT 
    e.id, 
    ic.Year, 
    ic.Number_yaws, 
    ic.polio_cases, 
    ic.cases_guinea_worm, 
    ic.Number_rabies, 
    ic.Number_malaria, 
    ic.Number_hiv, 
    ic.Number_tuberculosis, 
    ic.Number_smallpox, 
    ic.Number_cholera_cases
FROM pandemic.infectious_cases ic
JOIN pandemic.entities e 
  ON ic.Entity = e.Entity;