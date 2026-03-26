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
Updated: 2026-03-26T14:23:21.446231+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.717 |  |
| ap-northeast-1 | 0.602 |  |
| ap-northeast-2 | 0.722 |  |
| ap-northeast-3 | 0.627 |  |
| ap-south-1 | 0.871 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.868 |  |
| ap-southeast-2 | 0.769 |  |
| ap-southeast-3 | 0.908 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.886 |  |
| ap-southeast-6 | 0.793 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.114 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.428 |  |
| eu-central-2 | 0.435 |  |
| eu-north-1 | 0.482 |  |
| eu-south-1 | 0.440 |  |
| eu-south-2 | 0.459 |  |
| eu-west-1 | 0.350 |  |
| eu-west-2 | 0.378 |  |
| eu-west-3 | 0.407 |  |
| il-central-1 | 0.587 |  |
| me-central-1 | 0.788 |  |
| me-south-1 | 0.750 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.528 |  |
| us-east-1 | 0.074 | 4363 |
| us-east-2 | 0.077 | 1456 |
| us-gov-east-1 | 0.081 | 1606 |
| us-gov-west-1 | 0.280 | 190 |
| us-west-1 | 0.223 | 3301 |
| us-west-2 | 0.284 | 151 |

