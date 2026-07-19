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
Updated: 2026-07-19T18:54:40.826625+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.720 |  |
| ap-east-2 | 0.671 |  |
| ap-northeast-1 | 0.545 |  |
| ap-northeast-2 | 0.657 |  |
| ap-northeast-3 | 0.580 |  |
| ap-south-1 | 0.866 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.808 |  |
| ap-southeast-2 | 0.714 |  |
| ap-southeast-3 | 0.856 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.832 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.905 |  |
| ca-central-1 | 0.188 | 16 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.479 |  |
| eu-north-1 | 0.500 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.497 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.417 |  |
| eu-west-3 | 0.448 |  |
| il-central-1 | 0.608 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.134 | 4886 |
| us-east-2 | 0.150 | 1657 |
| us-gov-east-1 | 0.147 | 1770 |
| us-gov-west-1 | 0.223 | 205 |
| us-west-1 | 0.193 | 3805 |
| us-west-2 | 0.223 | 167 |

