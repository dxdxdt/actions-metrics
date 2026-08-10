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
Updated: 2026-08-10T11:50:04.253013+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.618 |  |
| ap-northeast-1 | 0.494 |  |
| ap-northeast-2 | 0.602 |  |
| ap-northeast-3 | 0.520 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.753 |  |
| ap-southeast-2 | 0.640 |  |
| ap-southeast-3 | 0.811 |  |
| ap-southeast-4 | 0.681 |  |
| ap-southeast-5 | 0.771 |  |
| ap-southeast-6 | 0.696 |  |
| ap-southeast-7 | 0.850 |  |
| ca-central-1 | 0.258 | 18 |
| ca-west-1 | 0.189 |  |
| eu-central-1 | 0.535 |  |
| eu-central-2 | 0.547 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.560 |  |
| eu-south-2 | 0.570 |  |
| eu-west-1 | 0.469 |  |
| eu-west-2 | 0.489 |  |
| eu-west-3 | 0.512 |  |
| il-central-1 | 0.702 |  |
| me-central-1 | 0.922 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.643 |  |
| us-east-1 | 0.209 | 4966 |
| us-east-2 | 0.194 | 1678 |
| us-gov-east-1 | 0.214 | 1816 |
| us-gov-west-1 | 0.157 | 216 |
| us-west-1 | 0.118 | 3916 |
| us-west-2 | 0.162 | 176 |

