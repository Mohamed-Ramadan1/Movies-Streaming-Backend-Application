-- id => serial PRIMERY KEY  NOT NULL
-- firstName=>
-- lastName=>
-- password=>
-- passwordResetToken=>
-- passwordResetExpires=>
-- email=>
-- roles=>
-- phoneNumber=>
-- address=>
-- age=>
-- profileImage=>
-- profileImagePublicId=>
-- dataOfBerth=>
-- country=>
-- subscriptionPlan=>
-- isEmailVerified=>
-- emailVerificationToken=>
-- emailVerificationTokenExpiresAt=>
-- isSubscriptionActive=>
-- isAccountActive=>
-- isNotificationMuted=>
-- createdAt=> time stamp with time zone
-- updatedAt=> time stamp  with time zone

CREATE TABLE users (
    id SERIAL PRIMARY KEY NOT NULL,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL, -- To store hashed passwords
    passwordSalt VARCHAR(255), -- Optional: for password hashing
    passwordResetToken VARCHAR(255),
    passwordResetExpires TIMESTAMPTZ,
    email VARCHAR(255) NOT NULL UNIQUE,
    roles TEXT[] DEFAULT ARRAY['user'], -- Or use ENUM based roles
    phoneNumber VARCHAR(20) UNIQUE,
    address VARCHAR(255),
    age INTEGER,
    profileImage VARCHAR(255),
    profileImagePublicId VARCHAR(255),
    dateOfBirth DATE,
    country VARCHAR(50),
    subscriptionPlan subscriptionType DEFAULT 'free', -- Use ENUM for subscription plans
    isEmailVerified BOOLEAN DEFAULT FALSE,
    emailVerificationToken VARCHAR(255),
    emailVerificationTokenExpiresAt TIMESTAMPTZ,
    isSubscriptionActive BOOLEAN DEFAULT FALSE,
    isAccountActive BOOLEAN DEFAULT FALSE,
    isNotificationMuted BOOLEAN DEFAULT FALSE,
    metadata JSONB, -- For storing additional data
    createdAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deletedAt TIMESTAMPTZ -- Soft delete feature
);



CREATE INDEX idx_email ON users(email);
CREATE INDEX idx_isEmailVerified ON users(isEmailVerified);
CREATE INDEX idx_isAccountActive ON users(isAccountActive);


CREATE TYPE subscriptionType AS ENUM ('free', 'basic', 'premium');