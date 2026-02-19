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
Updated: 2026-02-19T18:41:56.190030+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.998 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.626 |  |
| ap-northeast-1 | 0.499 |  |
| ap-northeast-2 | 0.613 |  |
| ap-northeast-3 | 0.537 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.760 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.821 |  |
| ap-southeast-4 | 0.697 |  |
| ap-southeast-5 | 0.780 |  |
| ap-southeast-6 | 0.693 |  |
| ap-southeast-7 | 0.866 |  |
| ca-central-1 | 0.240 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.506 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.540 |  |
| eu-south-2 | 0.535 |  |
| eu-west-1 | 0.431 |  |
| eu-west-2 | 0.466 |  |
| eu-west-3 | 0.485 |  |
| il-central-1 | 0.685 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.856 |  |
| mx-central-1 | 0.231 |  |
| sa-east-1 | 0.609 |  |
| us-east-1 | 0.186 | 4145 |
| us-east-2 | 0.183 | 1356 |
| us-gov-east-1 | 0.184 | 1492 |
| us-gov-west-1 | 0.197 | 156 |
| us-west-1 | 0.127 | 3083 |
| us-west-2 | 0.191 | 128 |

