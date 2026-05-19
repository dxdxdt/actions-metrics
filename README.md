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
Updated: 2026-05-19T18:55:33.963822+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.654 |  |
| ap-northeast-1 | 0.535 |  |
| ap-northeast-2 | 0.639 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.923 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.786 |  |
| ap-southeast-2 | 0.696 |  |
| ap-southeast-3 | 0.842 |  |
| ap-southeast-4 | 0.736 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.764 |  |
| ap-southeast-7 | 0.888 |  |
| ca-central-1 | 0.177 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.507 |  |
| eu-central-2 | 0.518 |  |
| eu-north-1 | 0.531 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.533 |  |
| eu-west-1 | 0.417 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.477 |  |
| il-central-1 | 0.644 |  |
| me-central-1 | 0.858 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.197 |  |
| sa-east-1 | 0.602 |  |
| us-east-1 | 0.152 | 4663 |
| us-east-2 | 0.144 | 1603 |
| us-gov-east-1 | 0.122 | 1698 |
| us-gov-west-1 | 0.212 | 195 |
| us-west-1 | 0.155 | 3579 |
| us-west-2 | 0.217 | 158 |

