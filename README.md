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
Updated: 2026-08-22T08:19:33.308179+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.706 |  |
| ap-east-2 | 0.645 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.636 |  |
| ap-northeast-3 | 0.551 |  |
| ap-south-1 | 0.862 |  |
| ap-south-2 | 0.867 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.832 |  |
| ap-southeast-4 | 0.710 |  |
| ap-southeast-5 | 0.796 |  |
| ap-southeast-6 | 0.701 |  |
| ap-southeast-7 | 0.881 |  |
| ca-central-1 | 0.232 | 18 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.522 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.532 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.419 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.482 |  |
| il-central-1 | 0.660 |  |
| me-central-1 | 0.867 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.612 |  |
| us-east-1 | 0.166 | 5044 |
| us-east-2 | 0.184 | 1681 |
| us-gov-east-1 | 0.178 | 1868 |
| us-gov-west-1 | 0.195 | 225 |
| us-west-1 | 0.136 | 4018 |
| us-west-2 | 0.192 | 184 |

