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
Updated: 2026-10-24T23:53:59.575627+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.963 |  |
| ap-east-1 | 0.714 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.559 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.984 |  |
| ap-southeast-1 | 0.790 |  |
| ap-southeast-2 | 0.692 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.772 |  |
| ap-southeast-5 | 0.807 |  |
| ap-southeast-6 | 0.748 |  |
| ap-southeast-7 | 0.891 |  |
| ca-central-1 | 0.154 | 18 |
| ca-west-1 | 0.186 |  |
| eu-central-1 | 0.471 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.491 |  |
| eu-south-2 | 0.485 |  |
| eu-west-1 | 0.405 |  |
| eu-west-2 | 0.437 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.637 |  |
| me-central-1 | 0.826 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.174 |  |
| sa-east-1 | 0.604 |  |
| us-east-1 | 0.130 | 5159 |
| us-east-2 | 0.115 | 1709 |
| us-gov-east-1 | 0.135 | 1953 |
| us-gov-west-1 | 0.210 | 240 |
| us-west-1 | 0.150 | 4191 |
| us-west-2 | 0.208 | 195 |

