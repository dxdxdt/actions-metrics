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
Updated: 2026-04-20T13:11:30.914783+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.697 |  |
| ap-northeast-1 | 0.578 |  |
| ap-northeast-2 | 0.696 |  |
| ap-northeast-3 | 0.602 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.917 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.729 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.783 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.933 |  |
| ca-central-1 | 0.167 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.452 |  |
| eu-central-2 | 0.469 |  |
| eu-north-1 | 0.499 |  |
| eu-south-1 | 0.479 |  |
| eu-south-2 | 0.488 |  |
| eu-west-1 | 0.375 |  |
| eu-west-2 | 0.405 |  |
| eu-west-3 | 0.427 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.838 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.551 |  |
| us-east-1 | 0.112 | 4531 |
| us-east-2 | 0.110 | 1518 |
| us-gov-east-1 | 0.128 | 1657 |
| us-gov-west-1 | 0.254 | 194 |
| us-west-1 | 0.192 | 3448 |
| us-west-2 | 0.242 | 156 |

