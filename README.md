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
Updated: 2026-09-10T19:23:42.499893+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.013 |  |
| ap-east-1 | 0.655 |  |
| ap-east-2 | 0.590 |  |
| ap-northeast-1 | 0.474 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.500 |  |
| ap-south-1 | 0.945 |  |
| ap-south-2 | 0.933 |  |
| ap-southeast-1 | 0.754 |  |
| ap-southeast-2 | 0.629 |  |
| ap-southeast-3 | 0.786 |  |
| ap-southeast-4 | 0.677 |  |
| ap-southeast-5 | 0.752 |  |
| ap-southeast-6 | 0.667 |  |
| ap-southeast-7 | 0.838 |  |
| ca-central-1 | 0.264 | 18 |
| ca-west-1 | 0.239 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.593 |  |
| eu-south-1 | 0.568 |  |
| eu-south-2 | 0.573 |  |
| eu-west-1 | 0.460 |  |
| eu-west-2 | 0.497 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.945 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.181 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.203 | 5094 |
| us-east-2 | 0.218 | 1685 |
| us-gov-east-1 | 0.212 | 1906 |
| us-gov-west-1 | 0.165 | 233 |
| us-west-1 | 0.102 | 4097 |
| us-west-2 | 0.165 | 192 |

