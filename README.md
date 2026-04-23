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
Updated: 2026-04-23T20:05:40.564575+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.957 |  |
| ap-east-1 | 0.729 |  |
| ap-east-2 | 0.660 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.658 |  |
| ap-northeast-3 | 0.571 |  |
| ap-south-1 | 0.916 |  |
| ap-south-2 | 0.974 |  |
| ap-southeast-1 | 0.803 |  |
| ap-southeast-2 | 0.715 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.759 |  |
| ap-southeast-5 | 0.816 |  |
| ap-southeast-6 | 0.801 |  |
| ap-southeast-7 | 0.901 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.475 |  |
| eu-central-2 | 0.518 |  |
| eu-north-1 | 0.533 |  |
| eu-south-1 | 0.521 |  |
| eu-south-2 | 0.517 |  |
| eu-west-1 | 0.399 |  |
| eu-west-2 | 0.432 |  |
| eu-west-3 | 0.454 |  |
| il-central-1 | 0.672 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.585 |  |
| us-east-1 | 0.129 | 4549 |
| us-east-2 | 0.130 | 1527 |
| us-gov-east-1 | 0.119 | 1662 |
| us-gov-west-1 | 0.226 | 194 |
| us-west-1 | 0.169 | 3465 |
| us-west-2 | 0.225 | 157 |

