-- ---------------------------------------------------------------------------
-- Seed de uma API key para DESENVOLVIMENTO LOCAL (banco auth_db).
-- Roda apos o init.sql (que cria a tabela api_keys), na primeira subida.
--
-- Chave em texto plano: "tm_key_local_dev" (mesma usada em SERVICE_API_KEY).
-- O auth-service guarda apenas o hash SHA-256 (hex):
--   sha256("tm_key_local_dev") = c709867c218606676b2b1ee84ea7afab71747c44c866fafb6cda36006aaf3656
--
-- Assim o evaluation-service ja consegue chamar flag/targeting no ambiente local.
-- Em producao (nuvem) o seed e feito pelos Jobs em k8s/aws/db-init-jobs.yaml.
-- ---------------------------------------------------------------------------
INSERT INTO api_keys (name, key_hash, is_active)
VALUES (
    'evaluation-service-local',
    'c709867c218606676b2b1ee84ea7afab71747c44c866fafb6cda36006aaf3656',
    true
)
ON CONFLICT (key_hash) DO NOTHING;
