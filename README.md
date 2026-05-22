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
Updated: 2026-05-22T22:01:36.796899+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.980 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.642 |  |
| ap-northeast-1 | 0.527 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.859 |  |
| ap-southeast-1 | 0.772 |  |
| ap-southeast-2 | 0.704 |  |
| ap-southeast-3 | 0.826 |  |
| ap-southeast-4 | 0.755 |  |
| ap-southeast-5 | 0.792 |  |
| ap-southeast-6 | 0.735 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.209 | 16 |
| ca-west-1 | 0.185 |  |
| eu-central-1 | 0.497 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.547 |  |
| eu-south-1 | 0.517 |  |
| eu-south-2 | 0.535 |  |
| eu-west-1 | 0.408 |  |
| eu-west-2 | 0.454 |  |
| eu-west-3 | 0.483 |  |
| il-central-1 | 0.665 |  |
| me-central-1 | 0.869 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.264 |  |
| sa-east-1 | 0.613 |  |
| us-east-1 | 0.170 | 4676 |
| us-east-2 | 0.151 | 1607 |
| us-gov-east-1 | 0.160 | 1700 |
| us-gov-west-1 | 0.200 | 195 |
| us-west-1 | 0.191 | 3587 |
| us-west-2 | 0.197 | 159 |

