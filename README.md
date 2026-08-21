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
Updated: 2026-08-21T06:32:14.689009+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.992 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.619 |  |
| ap-northeast-1 | 0.501 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.529 |  |
| ap-south-1 | 0.907 |  |
| ap-south-2 | 0.910 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.655 |  |
| ap-southeast-3 | 0.811 |  |
| ap-southeast-4 | 0.701 |  |
| ap-southeast-5 | 0.780 |  |
| ap-southeast-6 | 0.692 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.244 | 18 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.538 |  |
| eu-north-1 | 0.577 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.553 |  |
| eu-west-1 | 0.441 |  |
| eu-west-2 | 0.471 |  |
| eu-west-3 | 0.500 |  |
| il-central-1 | 0.679 |  |
| me-central-1 | 0.903 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.629 |  |
| us-east-1 | 0.181 | 5035 |
| us-east-2 | 0.208 | 1680 |
| us-gov-east-1 | 0.203 | 1863 |
| us-gov-west-1 | 0.189 | 224 |
| us-west-1 | 0.127 | 4009 |
| us-west-2 | 0.190 | 184 |

