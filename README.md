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
Updated: 2026-02-27T01:19:03.859494+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.951 |  |
| ap-east-1 | 0.742 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.564 |  |
| ap-northeast-2 | 0.693 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.873 |  |
| ap-southeast-4 | 0.775 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.915 |  |
| ca-central-1 | 0.183 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.465 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.504 |  |
| eu-south-1 | 0.484 |  |
| eu-south-2 | 0.492 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.416 |  |
| eu-west-3 | 0.449 |  |
| il-central-1 | 0.631 |  |
| me-central-1 | 0.847 |  |
| me-south-1 | 0.794 |  |
| mx-central-1 | 0.254 |  |
| sa-east-1 | 0.562 |  |
| us-east-1 | 0.124 | 4192 |
| us-east-2 | 0.135 | 1381 |
| us-gov-east-1 | 0.142 | 1513 |
| us-gov-west-1 | 0.267 | 162 |
| us-west-1 | 0.203 | 3127 |
| us-west-2 | 0.269 | 132 |

