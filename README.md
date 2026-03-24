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
Updated: 2026-03-24T15:59:29.300395+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.734 |  |
| ap-northeast-1 | 0.616 |  |
| ap-northeast-2 | 0.733 |  |
| ap-northeast-3 | 0.635 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.874 |  |
| ap-southeast-2 | 0.796 |  |
| ap-southeast-3 | 0.922 |  |
| ap-southeast-4 | 0.840 |  |
| ap-southeast-5 | 0.892 |  |
| ap-southeast-6 | 0.834 |  |
| ap-southeast-7 | 0.970 |  |
| ca-central-1 | 0.132 | 16 |
| ca-west-1 | 0.254 |  |
| eu-central-1 | 0.405 |  |
| eu-central-2 | 0.420 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.427 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.328 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.383 |  |
| il-central-1 | 0.575 |  |
| me-central-1 | 0.778 |  |
| me-south-1 | 0.734 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.507 |  |
| us-east-1 | 0.072 | 4351 |
| us-east-2 | 0.116 | 1449 |
| us-gov-east-1 | 0.119 | 1600 |
| us-gov-west-1 | 0.301 | 190 |
| us-west-1 | 0.267 | 3290 |
| us-west-2 | 0.306 | 151 |

