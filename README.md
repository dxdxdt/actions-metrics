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
Updated: 2026-04-11T16:28:25.318269+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.883 |  |
| ap-east-1 | 0.810 |  |
| ap-east-2 | 0.744 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.645 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.922 |  |
| ap-southeast-1 | 0.883 |  |
| ap-southeast-2 | 0.792 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.826 |  |
| ap-southeast-5 | 0.893 |  |
| ap-southeast-6 | 0.883 |  |
| ap-southeast-7 | 0.978 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.344 |  |
| eu-central-1 | 0.385 |  |
| eu-central-2 | 0.401 |  |
| eu-north-1 | 0.439 |  |
| eu-south-1 | 0.412 |  |
| eu-south-2 | 0.418 |  |
| eu-west-1 | 0.304 |  |
| eu-west-2 | 0.342 |  |
| eu-west-3 | 0.364 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.762 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.488 |  |
| us-east-1 | 0.053 | 4479 |
| us-east-2 | 0.095 | 1494 |
| us-gov-east-1 | 0.096 | 1641 |
| us-gov-west-1 | 0.300 | 192 |
| us-west-1 | 0.254 | 3396 |
| us-west-2 | 0.314 | 155 |

