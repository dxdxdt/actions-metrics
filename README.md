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
Updated: 2026-08-22T03:35:40.572469+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.898 |  |
| ap-east-1 | 0.781 |  |
| ap-east-2 | 0.721 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.705 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.838 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.855 |  |
| ap-southeast-2 | 0.756 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.797 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.783 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.121 | 18 |
| ca-west-1 | 0.244 |  |
| eu-central-1 | 0.411 |  |
| eu-central-2 | 0.432 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.435 |  |
| eu-south-2 | 0.443 |  |
| eu-west-1 | 0.332 |  |
| eu-west-2 | 0.367 |  |
| eu-west-3 | 0.395 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.268 |  |
| sa-east-1 | 0.523 |  |
| us-east-1 | 0.079 | 5041 |
| us-east-2 | 0.095 | 1681 |
| us-gov-east-1 | 0.103 | 1868 |
| us-gov-west-1 | 0.275 | 225 |
| us-west-1 | 0.223 | 4016 |
| us-west-2 | 0.274 | 184 |

