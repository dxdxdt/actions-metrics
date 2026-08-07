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
Updated: 2026-08-07T04:49:44.788806+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.894 |  |
| ap-east-1 | 0.784 |  |
| ap-east-2 | 0.721 |  |
| ap-northeast-1 | 0.605 |  |
| ap-northeast-2 | 0.713 |  |
| ap-northeast-3 | 0.629 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.913 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.808 |  |
| ap-southeast-7 | 0.963 |  |
| ca-central-1 | 0.103 | 18 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.405 |  |
| eu-central-2 | 0.429 |  |
| eu-north-1 | 0.451 |  |
| eu-south-1 | 0.431 |  |
| eu-south-2 | 0.438 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.363 |  |
| eu-west-3 | 0.391 |  |
| il-central-1 | 0.566 |  |
| me-central-1 | 0.784 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.520 |  |
| us-east-1 | 0.068 | 4949 |
| us-east-2 | 0.081 | 1674 |
| us-gov-east-1 | 0.077 | 1806 |
| us-gov-west-1 | 0.285 | 211 |
| us-west-1 | 0.237 | 3889 |
| us-west-2 | 0.284 | 172 |

