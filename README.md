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
Updated: 2026-03-06T20:24:20.114415+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.010 |  |
| ap-east-1 | 0.686 |  |
| ap-east-2 | 0.629 |  |
| ap-northeast-1 | 0.506 |  |
| ap-northeast-2 | 0.601 |  |
| ap-northeast-3 | 0.534 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.920 |  |
| ap-southeast-1 | 0.763 |  |
| ap-southeast-2 | 0.668 |  |
| ap-southeast-3 | 0.818 |  |
| ap-southeast-4 | 0.707 |  |
| ap-southeast-5 | 0.785 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.207 | 16 |
| ca-west-1 | 0.225 |  |
| eu-central-1 | 0.523 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.542 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.483 |  |
| eu-west-3 | 0.507 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.895 |  |
| me-south-1 | 0.871 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.169 | 4232 |
| us-east-2 | 0.153 | 1405 |
| us-gov-east-1 | 0.153 | 1532 |
| us-gov-west-1 | 0.181 | 173 |
| us-west-1 | 0.149 | 3186 |
| us-west-2 | 0.183 | 142 |

