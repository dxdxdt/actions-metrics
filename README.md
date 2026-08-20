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
Updated: 2026-08-20T09:25:58.039440+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.962 |  |
| ap-east-1 | 0.718 |  |
| ap-east-2 | 0.655 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.566 |  |
| ap-south-1 | 0.891 |  |
| ap-south-2 | 0.954 |  |
| ap-southeast-1 | 0.794 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.845 |  |
| ap-southeast-4 | 0.743 |  |
| ap-southeast-5 | 0.811 |  |
| ap-southeast-6 | 0.726 |  |
| ap-southeast-7 | 0.897 |  |
| ca-central-1 | 0.190 | 18 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.481 |  |
| eu-central-2 | 0.497 |  |
| eu-north-1 | 0.513 |  |
| eu-south-1 | 0.504 |  |
| eu-south-2 | 0.520 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.439 |  |
| eu-west-3 | 0.457 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.830 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.253 |  |
| sa-east-1 | 0.608 |  |
| us-east-1 | 0.135 | 5027 |
| us-east-2 | 0.145 | 1680 |
| us-gov-east-1 | 0.121 | 1860 |
| us-gov-west-1 | 0.221 | 224 |
| us-west-1 | 0.160 | 4000 |
| us-west-2 | 0.219 | 184 |

