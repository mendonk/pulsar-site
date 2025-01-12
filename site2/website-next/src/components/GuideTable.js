import * as React from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableRow from "@mui/material/TableRow";
import Link from "@mui/material/Link";
// import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import Translate, { translate } from "@docusaurus/Translate";

export default function VersionsTable(props) {
  // const { siteConfig } = useDocusaurusContext();
  return (
    <Table size="small">
      <TableBody>
        <TableRow key="header">
          {["Client guide", "API docs"].map((header) => (
            <TableCell
              className="border-gray-300 font-bold text-black"
              sx={{ border: 1 }}
              align="left"
              key={header}
            >
              <Translate>{header}</Translate>
            </TableCell>
          ))}
        </TableRow>
        {props.data.map((row, index) => (
          <TableRow key={index}>
            <TableCell
              className="border-gray-300"
              sx={{ border: 1 }}
              align="left"
            >
              <Link
                className="text-primary"
                href={row.link}
                underline="none"
                target="_blank"
              >
                {row.name}
              </Link>
            </TableCell>
            <TableCell
              className="border-gray-300 font-bold"
              sx={{ border: 1 }}
              align="left"
            >
              {row.description}
            </TableCell>
          </TableRow>
        ))}
      </TableBody>
    </Table>
  );
}
