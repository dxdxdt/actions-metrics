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
Updated: 2026-07-17T11:16:38.119924+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.954 |  |
| ap-east-1 | 0.732 |  |
| ap-east-2 | 0.679 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.585 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.944 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.717 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.757 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.148 | 16 |
| ca-west-1 | 0.228 |  |
| eu-central-1 | 0.468 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.533 |  |
| eu-south-1 | 0.493 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.394 |  |
| eu-west-2 | 0.427 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.621 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.582 |  |
| us-east-1 | 0.115 | 4875 |
| us-east-2 | 0.120 | 1656 |
| us-gov-east-1 | 0.095 | 1763 |
| us-gov-west-1 | 0.226 | 202 |
| us-west-1 | 0.175 | 3791 |
| us-west-2 | 0.229 | 166 |

