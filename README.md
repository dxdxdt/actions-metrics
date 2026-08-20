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
Updated: 2026-08-20T07:34:26.999389+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.892 |  |
| ap-east-1 | 0.799 |  |
| ap-east-2 | 0.738 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.733 |  |
| ap-northeast-3 | 0.646 |  |
| ap-south-1 | 0.830 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.788 |  |
| ap-southeast-3 | 0.923 |  |
| ap-southeast-4 | 0.832 |  |
| ap-southeast-5 | 0.890 |  |
| ap-southeast-6 | 0.809 |  |
| ap-southeast-7 | 0.979 |  |
| ca-central-1 | 0.110 | 18 |
| ca-west-1 | 0.295 |  |
| eu-central-1 | 0.391 |  |
| eu-central-2 | 0.420 |  |
| eu-north-1 | 0.444 |  |
| eu-south-1 | 0.421 |  |
| eu-south-2 | 0.438 |  |
| eu-west-1 | 0.321 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.552 |  |
| me-central-1 | 0.782 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.300 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.060 | 5027 |
| us-east-2 | 0.081 | 1680 |
| us-gov-east-1 | 0.085 | 1859 |
| us-gov-west-1 | 0.305 | 224 |
| us-west-1 | 0.244 | 3999 |
| us-west-2 | 0.296 | 184 |

