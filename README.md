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
Updated: 2026-04-27T15:00:03.588444+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.975 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.678 |  |
| ap-northeast-1 | 0.579 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.601 |  |
| ap-south-1 | 0.924 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.124 | 16 |
| ca-west-1 | 0.227 |  |
| eu-central-1 | 0.491 |  |
| eu-central-2 | 0.494 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.501 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.407 |  |
| eu-west-2 | 0.436 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.115 | 4571 |
| us-east-2 | 0.083 | 1539 |
| us-gov-east-1 | 0.086 | 1666 |
| us-gov-west-1 | 0.233 | 194 |
| us-west-1 | 0.186 | 3489 |
| us-west-2 | 0.237 | 157 |

