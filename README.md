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
Updated: 2026-05-13T21:19:28.528551+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.902 |  |
| ap-east-1 | 0.798 |  |
| ap-east-2 | 0.736 |  |
| ap-northeast-1 | 0.624 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.859 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.869 |  |
| ap-southeast-2 | 0.788 |  |
| ap-southeast-3 | 0.911 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.892 |  |
| ap-southeast-6 | 0.855 |  |
| ap-southeast-7 | 0.980 |  |
| ca-central-1 | 0.131 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.424 |  |
| eu-central-2 | 0.434 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.455 |  |
| eu-west-1 | 0.340 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.399 |  |
| il-central-1 | 0.576 |  |
| me-central-1 | 0.805 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.535 |  |
| us-east-1 | 0.079 | 4633 |
| us-east-2 | 0.093 | 1591 |
| us-gov-east-1 | 0.095 | 1688 |
| us-gov-west-1 | 0.287 | 195 |
| us-west-1 | 0.236 | 3560 |
| us-west-2 | 0.276 | 158 |

