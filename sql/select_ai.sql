BEGIN
    DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
        host => 'generativelanguage.googleapis.com',
        ace  => xs$ace_type(privilege_list => xs$name_list('http'),
                            principal_name => 'ADMIN',
                            principal_type => xs_acl.ptype_db)
    );
END;
/

BEGIN
    BEGIN
        DBMS_CLOUD.DROP_CREDENTIAL(credential_name => 'GEMINI_CRED');
    EXCEPTION WHEN OTHERS THEN NULL;
    END;

    DBMS_CLOUD.CREATE_CREDENTIAL(
        credential_name => 'GEMINI_CRED',
        username        => 'google',
        password        => 'COLE_AQUI_SUA_CHAVE_DO_GEMINI'
    );
END;
/

BEGIN
    BEGIN
        DBMS_CLOUD_AI.DROP_PROFILE(profile_name => 'genai', force => true);
    EXCEPTION WHEN OTHERS THEN NULL;
    END;

    DBMS_CLOUD_AI.CREATE_PROFILE(
        profile_name => 'genai',
        attributes   => '{
            "provider": "google",
            "credential_name": "GEMINI_CRED",
            "object_list": [{"owner": "ADMIN"}]
        }'
    );
END;
/
