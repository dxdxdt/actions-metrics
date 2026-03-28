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
Updated: 2026-03-28T12:37:29.245206+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.875 |  |
| ap-east-1 | 0.806 |  |
| ap-east-2 | 0.738 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.735 |  |
| ap-northeast-3 | 0.651 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.881 |  |
| ap-southeast-2 | 0.795 |  |
| ap-southeast-3 | 0.945 |  |
| ap-southeast-4 | 0.833 |  |
| ap-southeast-5 | 0.903 |  |
| ap-southeast-6 | 0.831 |  |
| ap-southeast-7 | 0.994 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.286 |  |
| eu-central-1 | 0.389 |  |
| eu-central-2 | 0.405 |  |
| eu-north-1 | 0.449 |  |
| eu-south-1 | 0.413 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.311 |  |
| eu-west-2 | 0.343 |  |
| eu-west-3 | 0.365 |  |
| il-central-1 | 0.567 |  |
| me-central-1 | 0.771 |  |
| me-south-1 | 0.733 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.491 |  |
| us-east-1 | 0.061 | 4379 |
| us-east-2 | 0.089 | 1459 |
| us-gov-east-1 | 0.101 | 1610 |
| us-gov-west-1 | 0.327 | 190 |
| us-west-1 | 0.256 | 3314 |
| us-west-2 | 0.316 | 152 |

