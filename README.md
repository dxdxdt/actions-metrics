# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-02-26T08:37:55.293089+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.529 |  |
| ap-northeast-2 | 0.645 |  |
| ap-northeast-3 | 0.559 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.923 |  |
| ap-southeast-1 | 0.787 |  |
| ap-southeast-2 | 0.690 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.815 |  |
| ap-southeast-6 | 0.724 |  |
| ap-southeast-7 | 0.887 |  |
| ca-central-1 | 0.181 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.533 |  |
| eu-north-1 | 0.544 |  |
| eu-south-1 | 0.524 |  |
| eu-south-2 | 0.538 |  |
| eu-west-1 | 0.426 |  |
| eu-west-2 | 0.455 |  |
| eu-west-3 | 0.476 |  |
| il-central-1 | 0.681 |  |
| me-central-1 | 0.883 |  |
| me-south-1 | 0.836 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.602 |  |
| us-east-1 | 0.146 | 4185 |
| us-east-2 | 0.131 | 1380 |
| us-gov-east-1 | 0.129 | 1511 |
| us-gov-west-1 | 0.193 | 162 |
| us-west-1 | 0.179 | 3122 |
| us-west-2 | 0.196 | 132 |

