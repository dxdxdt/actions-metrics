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
Updated: 2026-02-28T05:28:52.788660+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.999 |  |
| ap-east-1 | 0.689 |  |
| ap-east-2 | 0.630 |  |
| ap-northeast-1 | 0.512 |  |
| ap-northeast-2 | 0.619 |  |
| ap-northeast-3 | 0.536 |  |
| ap-south-1 | 0.948 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.765 |  |
| ap-southeast-2 | 0.674 |  |
| ap-southeast-3 | 0.822 |  |
| ap-southeast-4 | 0.716 |  |
| ap-southeast-5 | 0.784 |  |
| ap-southeast-6 | 0.734 |  |
| ap-southeast-7 | 0.863 |  |
| ca-central-1 | 0.205 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.505 |  |
| eu-central-2 | 0.516 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.526 |  |
| eu-south-2 | 0.539 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.456 |  |
| eu-west-3 | 0.483 |  |
| il-central-1 | 0.692 |  |
| me-central-1 | 0.883 |  |
| me-south-1 | 0.855 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.611 |  |
| us-east-1 | 0.163 | 4196 |
| us-east-2 | 0.156 | 1382 |
| us-gov-east-1 | 0.150 | 1518 |
| us-gov-west-1 | 0.170 | 164 |
| us-west-1 | 0.169 | 3138 |
| us-west-2 | 0.171 | 133 |

