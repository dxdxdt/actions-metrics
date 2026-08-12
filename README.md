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
Updated: 2026-08-12T15:52:56.411581+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.938 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.565 |  |
| ap-northeast-2 | 0.669 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.870 |  |
| ap-south-2 | 0.959 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.794 |  |
| ap-southeast-5 | 0.838 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.922 |  |
| ca-central-1 | 0.185 | 18 |
| ca-west-1 | 0.217 |  |
| eu-central-1 | 0.460 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.519 |  |
| eu-south-1 | 0.480 |  |
| eu-south-2 | 0.492 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.415 |  |
| eu-west-3 | 0.443 |  |
| il-central-1 | 0.610 |  |
| me-central-1 | 0.862 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.566 |  |
| us-east-1 | 0.117 | 4979 |
| us-east-2 | 0.145 | 1679 |
| us-gov-east-1 | 0.165 | 1822 |
| us-gov-west-1 | 0.247 | 221 |
| us-west-1 | 0.208 | 3931 |
| us-west-2 | 0.248 | 176 |

