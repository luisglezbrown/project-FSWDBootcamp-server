<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210704101733 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE tour (id INT AUTO_INCREMENT NOT NULL, user_id INT NOT NULL, city_id INT NOT NULL, title VARCHAR(64) NOT NULL, duration DOUBLE PRECISION NOT NULL, week_days LONGTEXT NOT NULL COMMENT \'(DC2Type:simple_array)\', categories LONGTEXT NOT NULL COMMENT \'(DC2Type:simple_array)\', highlight VARCHAR(128) NOT NULL, starting_time VARCHAR(8) NOT NULL, meeting_point VARCHAR(128) NOT NULL, description LONGTEXT NOT NULL, imgpath VARCHAR(255) NOT NULL, ranking INT DEFAULT NULL, INDEX IDX_6AD1F969A76ED395 (user_id), INDEX IDX_6AD1F9698BAC62AF (city_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT FK_6AD1F969A76ED395 FOREIGN KEY (user_id) REFERENCES user (id)');
        $this->addSql('ALTER TABLE tour ADD CONSTRAINT FK_6AD1F9698BAC62AF FOREIGN KEY (city_id) REFERENCES city (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP TABLE tour');
    }
}
