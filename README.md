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
Updated: 2026-05-22T06:42:56.455382+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.943 |  |
| ap-east-1 | 0.774 |  |
| ap-east-2 | 0.708 |  |
| ap-northeast-1 | 0.599 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.620 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.895 |  |
| ap-southeast-4 | 0.796 |  |
| ap-southeast-5 | 0.866 |  |
| ap-southeast-6 | 0.794 |  |
| ap-southeast-7 | 0.949 |  |
| ca-central-1 | 0.146 | 16 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.449 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.489 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.480 |  |
| eu-west-1 | 0.363 |  |
| eu-west-2 | 0.399 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.614 |  |
| me-central-1 | 0.848 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.543 |  |
| us-east-1 | 0.107 | 4673 |
| us-east-2 | 0.100 | 1605 |
| us-gov-east-1 | 0.108 | 1700 |
| us-gov-west-1 | 0.276 | 195 |
| us-west-1 | 0.216 | 3587 |
| us-west-2 | 0.276 | 158 |

