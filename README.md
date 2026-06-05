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
Updated: 2026-06-05T10:51:43.575830+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.521 |  |
| ap-northeast-2 | 0.629 |  |
| ap-northeast-3 | 0.545 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.773 |  |
| ap-southeast-2 | 0.659 |  |
| ap-southeast-3 | 0.825 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.792 |  |
| ap-southeast-6 | 0.692 |  |
| ap-southeast-7 | 0.875 |  |
| ca-central-1 | 0.220 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.509 |  |
| eu-central-2 | 0.551 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.547 |  |
| eu-south-2 | 0.552 |  |
| eu-west-1 | 0.440 |  |
| eu-west-2 | 0.467 |  |
| eu-west-3 | 0.502 |  |
| il-central-1 | 0.675 |  |
| me-central-1 | 0.915 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.180 | 4722 |
| us-east-2 | 0.161 | 1624 |
| us-gov-east-1 | 0.186 | 1708 |
| us-gov-west-1 | 0.184 | 196 |
| us-west-1 | 0.133 | 3635 |
| us-west-2 | 0.182 | 162 |

