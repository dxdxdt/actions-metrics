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
Updated: 2026-04-30T23:44:40.599340+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.933 |  |
| ap-east-1 | 0.757 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.692 |  |
| ap-northeast-3 | 0.605 |  |
| ap-south-1 | 0.822 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.882 |  |
| ap-southeast-4 | 0.791 |  |
| ap-southeast-5 | 0.852 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.937 |  |
| ca-central-1 | 0.145 | 16 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.453 |  |
| eu-central-2 | 0.463 |  |
| eu-north-1 | 0.491 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.396 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.602 |  |
| me-central-1 | 0.808 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.544 |  |
| us-east-1 | 0.101 | 4577 |
| us-east-2 | 0.112 | 1551 |
| us-gov-east-1 | 0.112 | 1669 |
| us-gov-west-1 | 0.255 | 194 |
| us-west-1 | 0.201 | 3508 |
| us-west-2 | 0.255 | 157 |

