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
Updated: 2026-05-04T05:57:00.031877+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.979 |  |
| ap-east-1 | 0.719 |  |
| ap-east-2 | 0.659 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.570 |  |
| ap-south-1 | 0.906 |  |
| ap-south-2 | 0.964 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.705 |  |
| ap-southeast-3 | 0.853 |  |
| ap-southeast-4 | 0.753 |  |
| ap-southeast-5 | 0.822 |  |
| ap-southeast-6 | 0.754 |  |
| ap-southeast-7 | 0.906 |  |
| ca-central-1 | 0.159 | 16 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.504 |  |
| eu-central-2 | 0.499 |  |
| eu-north-1 | 0.543 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.524 |  |
| eu-west-1 | 0.425 |  |
| eu-west-2 | 0.445 |  |
| eu-west-3 | 0.473 |  |
| il-central-1 | 0.659 |  |
| me-central-1 | 0.859 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.183 |  |
| sa-east-1 | 0.590 |  |
| us-east-1 | 0.133 | 4591 |
| us-east-2 | 0.102 | 1565 |
| us-gov-east-1 | 0.102 | 1672 |
| us-gov-west-1 | 0.210 | 194 |
| us-west-1 | 0.162 | 3529 |
| us-west-2 | 0.213 | 157 |

