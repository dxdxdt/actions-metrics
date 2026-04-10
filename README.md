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
Updated: 2026-04-10T20:28:03.362127+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.949 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.576 |  |
| ap-northeast-2 | 0.663 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.813 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.884 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.912 |  |
| ca-central-1 | 0.175 | 16 |
| ca-west-1 | 0.260 |  |
| eu-central-1 | 0.458 |  |
| eu-central-2 | 0.482 |  |
| eu-north-1 | 0.515 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.441 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.836 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.567 |  |
| us-east-1 | 0.127 | 4473 |
| us-east-2 | 0.124 | 1491 |
| us-gov-east-1 | 0.131 | 1638 |
| us-gov-west-1 | 0.246 | 192 |
| us-west-1 | 0.185 | 3391 |
| us-west-2 | 0.231 | 155 |

