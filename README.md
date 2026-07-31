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
Updated: 2026-07-31T05:58:13.235524+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.916 |  |
| ap-east-1 | 0.763 |  |
| ap-east-2 | 0.701 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.691 |  |
| ap-northeast-3 | 0.611 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.838 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.892 |  |
| ap-southeast-4 | 0.806 |  |
| ap-southeast-5 | 0.858 |  |
| ap-southeast-6 | 0.782 |  |
| ap-southeast-7 | 0.939 |  |
| ca-central-1 | 0.151 | 17 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.434 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.478 |  |
| eu-south-1 | 0.452 |  |
| eu-south-2 | 0.460 |  |
| eu-west-1 | 0.347 |  |
| eu-west-2 | 0.390 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.582 |  |
| me-central-1 | 0.835 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.100 | 4924 |
| us-east-2 | 0.119 | 1672 |
| us-gov-east-1 | 0.108 | 1789 |
| us-gov-west-1 | 0.270 | 208 |
| us-west-1 | 0.209 | 3858 |
| us-west-2 | 0.269 | 172 |

