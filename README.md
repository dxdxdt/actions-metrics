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
Updated: 2026-07-19T08:03:00.797878+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.655 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.475 |  |
| ap-northeast-2 | 0.585 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.730 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.685 |  |
| ap-southeast-5 | 0.750 |  |
| ap-southeast-6 | 0.710 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.276 | 16 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.540 |  |
| eu-central-2 | 0.566 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.566 |  |
| eu-west-1 | 0.456 |  |
| eu-west-2 | 0.502 |  |
| eu-west-3 | 0.517 |  |
| il-central-1 | 0.700 |  |
| me-central-1 | 0.935 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.651 |  |
| us-east-1 | 0.207 | 4884 |
| us-east-2 | 0.223 | 1657 |
| us-gov-east-1 | 0.205 | 1769 |
| us-gov-west-1 | 0.158 | 204 |
| us-west-1 | 0.120 | 3801 |
| us-west-2 | 0.160 | 167 |

