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
Updated: 2026-04-19T16:31:21.718232+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.963 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.674 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.570 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.973 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.768 |  |
| ap-southeast-5 | 0.825 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.192 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.491 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.495 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.391 |  |
| eu-west-2 | 0.431 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.656 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.573 |  |
| us-east-1 | 0.130 | 4526 |
| us-east-2 | 0.160 | 1515 |
| us-gov-east-1 | 0.146 | 1656 |
| us-gov-west-1 | 0.242 | 194 |
| us-west-1 | 0.179 | 3444 |
| us-west-2 | 0.242 | 156 |

