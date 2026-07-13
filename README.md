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
Updated: 2026-07-13T17:09:04.859690+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.867 |  |
| ap-east-1 | 0.831 |  |
| ap-east-2 | 0.774 |  |
| ap-northeast-1 | 0.655 |  |
| ap-northeast-2 | 0.762 |  |
| ap-northeast-3 | 0.680 |  |
| ap-south-1 | 0.830 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.907 |  |
| ap-southeast-2 | 0.788 |  |
| ap-southeast-3 | 0.962 |  |
| ap-southeast-4 | 0.836 |  |
| ap-southeast-5 | 0.926 |  |
| ap-southeast-6 | 0.833 |  |
| ap-southeast-7 | 1.009 |  |
| ca-central-1 | 0.116 | 16 |
| ca-west-1 | 0.300 |  |
| eu-central-1 | 0.382 |  |
| eu-central-2 | 0.412 |  |
| eu-north-1 | 0.440 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.417 |  |
| eu-west-1 | 0.311 |  |
| eu-west-2 | 0.352 |  |
| eu-west-3 | 0.365 |  |
| il-central-1 | 0.548 |  |
| me-central-1 | 0.772 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.493 |  |
| us-east-1 | 0.056 | 4865 |
| us-east-2 | 0.083 | 1656 |
| us-gov-east-1 | 0.100 | 1743 |
| us-gov-west-1 | 0.320 | 202 |
| us-west-1 | 0.269 | 3773 |
| us-west-2 | 0.321 | 165 |

